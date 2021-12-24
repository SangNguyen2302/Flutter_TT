
class MovieModel {

  final String id;
  final String name;
  final String image;
  final double qualification;
  final String description;
  final String author;

  const MovieModel({
    required this.id,
    required this.name,
    required this.image,
    required this.qualification,
    required this.description,
    required this.author
  });


  static List<MovieModel> listMovie = [

    MovieModel(
        id: '3',
        name: 'Drive Hard',
        author:'Nguyen Sang',
        image: 'images/film1.jpeg',
        qualification: 4,// ngoi sao ratting
        description: 'In "No Time to Die", James Bond (Daniel Craig) finds himself enjoying a well-deserved vacation in Jamaica. However, his peace ends when his CIA friend, Felix Leiter (Jeffrey Wright), seeks him out for a new mission that involves rescuing an important scientist who has been kidnapped.'
    ),
    MovieModel(
        id: '4',
        name: 'JAWS',
        author:'Nguyen Sang sup2',
        image: 'images/film2.jpeg',
        qualification: 4.8,
        description: 'A bank worker discovers that he is actually a player in a video game.'
    ),
    MovieModel(
        id: '5',
        name: 'Con Vàng',
        author:'Nguyen Sang Sup',
        image: 'images/film3.jpeg',
        qualification: 4.2,
        description: 'Dựa trên truyện ngắn Lão Hạc của nhà văn Nam Cao, Cậu Vàng kể về cuộc đời khốn khổ của Lão Hạc cùng chú chó thuần Việt được lão đặt tên là Cậu Vàng. Theo lời thầy phong thủy, Bá Kiến – Chánh tổng giàu có và quyền lực ở làng quyết tâm phải chiếm đoạt được mảnh vườn của nhà Lão Hạc để củng cố long mạch gia tộc nên hắn và con trai mình đã rắp tâm bày đủ âm mưu để hãm hại lão. Một mình đơn độc, nghèo hèn, yếu thế, liệu rằng Lão Hạc có chống lại được lũ gian manh hay không?'
    ),
    MovieModel(
        id: '6',
        name: 'Avengers The End',
        author:'Nguyen Sang',
        image: 'images/avengers.jpeg',
        qualification: 4.2,
        description: 'Avengers The End must face the past that he thought he had left behind when he is drawn into the web of the mysterious Ten Rings organization.'
    ),

  ];


}