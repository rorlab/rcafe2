# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 디폴트 게시판 생성
Bulletin.create! title: '공지사항'
Bulletin.create! title: '새소식'
Bulletin.create! title: '가입인사', post_type: :blog
Bulletin.create! title: '갤러리', post_type: :gallery
