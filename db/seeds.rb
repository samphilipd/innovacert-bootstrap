### WARNING
### running rake db:seed using this file will DESTROY ALL CURRENT DATA IN THE DATABASE
###

### DO NOT RUN ON PRODUCTION DATABASE ###

# . . .
# Seed example UCLs
Ucl.destroy_all
Ucl.create!(code: 'MT001',
            name: 'Trabajar con Seguridad',
            description: 'Certificar como trabajar con seguridad en las mineras de Chile.')

Ucl.create!(code: 'ES001',
            name: 'Controlar posicionamiento de equipo de sondajes',
            description: 'Certificar como usar y controlar el posicionamiento de equipo de sondajes en las mineras de Chile.')

Ucl.create!(code: 'MPSO001',
            name: 'Perforar Sondajes',
            description: 'Certificar como perforar sondaje diamantina, perforar sondaje de polvo (Aire Reverso) y finalizar sondaje.')

Ucl.create!(code: 'MPSO002',
            name: 'Colaborar en trabajos de sondaje',
            description: 'Certificar como preparar área y recursos de perforación, apoyar perforación y recepcionar testigo.')

Ucl.create!(code: 'MPSO003',
            name: 'Mantener estado de herramientas de sondaje',
            description: 'Certificar como mantener herramientas de sondaje y mantener herramientas de sondaje.')

Ucl.create!(code: 'MPSO004',
            name: 'Controlar proceso de muestreo',
            description: 'Certificar como controlar el proceso de muestreo.')

# . . .
# Seed example workers
Worker.destroy_all
pedro = Worker.create!(name: 'Pedro',
                       rut: '123456789',
                       email_address: 'pedro@example.com')
# pedro is a certified operador
pedro.ucls << Ucl.where(code: ['MPSO001', 'MT001']) #TODO replace these with collections of UCLs in profiles

felipe = Worker.create!(name: 'Felipe',
                       rut: '223456789',
                       email_address: 'felipe@example.com')
#felipe is a new miner with no specializations yet
felipe.ucls << Ucl.find_by(code: 'MT001') # basic mining safety

rodrigo = Worker.create!(name: 'Rodrigo',
                       rut: '323456789',
                       email_address: 'rodrigo@example.com')
# rodrigo is pedro's assistant and a certified ayudante
rodrigo.ucls << Ucl.where(code: ['MT001', 'MPSO003', 'MPSO002'])

# . . .
# TODO add table for profiles

# . . .
# Seed example instruments
Instrument.destroy_all

instrument = Ucl.find_by(code: 'MT001').instruments.create!(name: 'Instrumento para MT001')

s1 = ObservationSection.new(name: "Perform pre-operational check of equipment, checking wear elements, structures, tires and components, technical specifications, standards and procedures", section_number: 1)
s1.observation_questions << ObservationQuestion.new(content: "Question 1")
s1.observation_questions << ObservationQuestion.new(content: "Question 2")
instrument.observation_sections << s1

i1 = InterviewSection.new(name: "Perform pre-operational check of equipment, checking wear elements, structures, tires and components, technical specifications", section_number: 1)
i1.interview_questions << InterviewQuestion.new(question_content: "Question 1", question_number: 1, sample_answer: "Answer 1")
i1.interview_questions << InterviewQuestion.new(question_content: "Question 2", question_number: 2, sample_answer: "Answer 2")
instrument.interview_sections << i1

s2 = ObservationSection.new(name: "Ensures information regarding the work to be performed (type of work and areas) with the head of sector, according to company procedures", section_number: 2)
s2.observation_questions << ObservationQuestion.new(content: "Question 1")
instrument.observation_sections << s2

i2 = InterviewSection.new(name: "Ensures information regarding the work to be performed (type of work and areas) with the head of sector, according to company procedures", section_number: 2)
i2.interview_questions << InterviewQuestion.new(question_content: "Question 1", question_number: 1, sample_answer: "Answer 1")
instrument.interview_sections << i2

s3 = ObservationSection.new(name: "It supplies fuel according to specific procedures of the company", section_number: 3)
instrument.observation_sections << s3

i3 = InterviewSection.new(name: "It supplies fuel according to specific procedures of the company", section_number: 3)
instrument.interview_sections << i3
