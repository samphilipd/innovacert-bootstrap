class RutValidator < ActiveModel::Validator

  # Validates that RUT matches format string: "12345678k"
  # where first 8 digits are integers and final char is integer or 'k'.
  # If RUT is only 7 digits, first digit must be padded with a zero or validation will fail.
  # If verify is set, additionally run a verification algorithm to check validity:
  # RUT verification algorithm as follows:
  ## 1. Multiply, from left to right, first 8 digits with following factors: 3, 2, 7, 6, 5, 4, 3, 2 and sum those results (let’s call it total)
  ## 2. Find difference: 11 – (total % 11) (let’s call it rest)
  ## 3. Determine control char by:
  ##    5.1 If rest = 11, than control char “0” (zero)
  ##    5.2 If rest = 1, than control char “K”
  ##    5.3 Otherwise, rest is control char
  ## 4. If the original control char (9th char) is equal to calculated control char, RUT is valid.
  #
  # Returns true if valid, false if invalid
  def validate(record)
    @rut = record.rut
    if @rut !~ %r{^[0-9]{8}[0-9k]$}i
      record.errors[:rut] << "is not a valid 9 character string"
    end
    # NOTE algorithm implementation or definition is buggy - disabled for now
    verify = false

    if verify
      if @rut[-1].downcase == "k"
        control_char = @rut[-1].downcase
      else
        control_char = @rut[-1].to_i
      end

      digits = @rut[0..-2].split(//).map {|s| s.to_i}
      coeffs = [3, 2, 7, 6, 5, 4, 3, 2]

      digits.each_with_index do |digit, index|
        digits[index] = digit * coeffs[index]
      end

      total = digits.sum
      rest = 11 - (total % 11)
      if (control_char == "k") and (rest != 10)
        record.errors[:rut] << "failed algorithm verification"
      elsif (control_char == 0) and (rest != 11)
        record.errors[:rut] << "failed algorithm verification"
      elsif rest != control_char
        record.errors[:rut] << "failed algorithm verification"
      end
    end
  end
end
