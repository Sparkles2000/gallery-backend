puts "Clearing old data..."

Artist.delete_all
Artwork.delete_all

a1 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)
a2 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)
a3 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)
a4 = Artist.create(name: Faker::Artist.name, interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample, artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample)

20.times do
    Artist.create(
        name: Faker::Name.name,
        interests: ['Block Art', 'Animals', 'Nature', 'Landscape', 'Human Anatomy', 'Still Life'].sample,
        artist_established: [2010-03-04, 2001-10-10, 1990-10-12].sample
    )
end

20.times do
    Artwork.create(
       name: Faker::Name.name,
       description: Faker::Lorem.sentence,
       published_date: [2010-03-04, 2001-10-10, 1990-10-12].sample,
       art_style: ['Textile', 'Oil Paint', 'Still Life', 'Landscape', 'Block Art', 'Sketch Art'].sample,
       img_url: Faker::LoremFlickr.image,
       artist: [a1, a2, a3, a4].sample
   )
   end
    
puts "Artist & Et all seeded"
puts "Seeded"