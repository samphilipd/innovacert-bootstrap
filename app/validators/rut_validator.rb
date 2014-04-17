class RutValidator < ActiveModel::Validator

  # Validates that RUT matches format string: "12345678k"
  # where first 8 digits are integers and final char is integer or 'k'.
  # If RUT is only 7 digits, first digit must be padded with a zero or validation will fail.
  # If verify is set, additionally run a verification algorithm to check validity:
  # RUT verification algorithm as follows:
  #   1) Split first 8 digits of RUT number from final control character
  #   2) Multiply digits elementwise by constant coefficients [3, 2, 7, 6, 5, 4, 3, 2]
  #   3) Sum the multiplied elements
  #   4) Take the remainder of sum % 11
  #   5) 11 - remainder = rest
  #   6) if rest == 11, control_char should be 0
  #   7) if rest == 10, control_char should be k
  #   8) else, rest == control_char
  # Returns true if valid, false if invalid
  def validate(record)
    @rut = record.rut
    if @rut !~ %r{^[0-9]{8}[0-9k]$}i
      record.errors[:rut] << "is not a valid 9 character string"
    end

    # use algorithmic verification
    verify = true

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
      if (rest != 10) and (control_char == "k")
        record.errors[:rut] << "failed algorithm verification"
      elsif (rest != 11) and (control_char == 0)
        record.errors[:rut] << "failed algorithm verification"
      elsif rest.between?(1,9) and (rest != control_char)
        record.errors[:rut] << "failed algorithm verification"
      end
    end
  end
end
