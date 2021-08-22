puts "Clearing old data..."

Artist.delete_all

a1 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)
a2 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)
a3 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)
a4 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)

20.times do
    Artist.create(
        name: Faker::Name.name,
        interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample,
        artist_established: [03/04/2010, 10/13/2001, 02/07/1990].sample
    )
end
    
puts "Artist & Et all seeded"
puts "Seeded"