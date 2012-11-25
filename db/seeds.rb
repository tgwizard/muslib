# coding: utf-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mozart = Composer.new(:short_name => 'Mozart', :full_name => 'Wolfgang
Amadeus Mozart', :date_born => '1756-01-27', :date_died => '1791-12-05',
:description => 'Mozart showed prodigious ability from his earliest childhood.
Already competent on keyboard and violin, he composed from the age of five and
performed before European royalty. At 17, he was engaged as a court musician in
Salzburg, but grew restless and travelled in search of a better position,
always composing abundantly. While visiting Vienna in 1781, he was dismissed
from his Salzburg position. He chose to stay in the capital, where he achieved
fame but little financial security. During his final years in Vienna, he
composed many of his best-known symphonies, concertos, and operas, and portions
of the Requiem, which was largely unfinished at the time of his death. The
circumstances of his early death have been much mythologized. He was survived
by his wife Constanze and two sons. Source: Wikipedia.')
mozart.update_slug
mozart.save!

bach = Composer.new(:short_name => 'Bach', :full_name => 'Johann Sebastian
Bach', :date_born => '1685-03-31', :date_died => '1750-07-28',
:description => 'Johann Sebastian Bach[1] was a German composer, organist,
harpsichordist, violist, and violinist of the Baroque Period. He enriched many
established German styles through his skill in counterpoint, harmonic and
motivic organisation, and the adaptation of rhythms, forms, and textures from
abroad, particularly from Italy and France. Many of Bach\'s works are still
known today, such as the Brandenburg Concertos, the Mass in B minor, the The
Well-Tempered Clavier, his cantatas, chorales, partitas, passions, and organ
works. His music is revered for its intellectual depth, technical command, and
artistic beauty. Source: Wikipedia.')
bach.update_slug
bach.save!

handel = Composer.new(:short_name => 'Handel', :full_name => 'Georg Friedrich Händel',
:english_name => 'George Frideric Handel', :date_born => '1685-02-23',
:date_died => '1759-04-14', :description => 'George Frideric Handel (German:
Georg Friedrich Händel) was a German-born British Baroque composer, famous for
his operas, oratorios, anthems and organ concertos. Handel was born in 1685, in
a family indifferent to music. He received critical musical training in Halle,
Hamburg and Italy before settling in London (1712) and becoming a naturalised
British subject in 1727.[1] By then he was strongly influenced by the great
composers of the Italian Baroque and the middle-German polyphonic choral
tradition. Source: Wikipedia.')
handel.update_slug
handel.save!
