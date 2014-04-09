# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###

# empty join tables
#Worker.ucl.delete_all
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

Ucl.create!(code: 'MPS003',
            name: 'Mantener estado de herramientas de sondaje.',
            description: 'Certificar como mantener herramientas de sondaje y mantener herramientas de sondaje.')

Ucl.create!(code: 'MPSO004',
            name: 'Controlar proceso de muestreo',
            description: 'TODO: write description here')

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

# TODO add table for profiles

