import 'package:equatable/equatable.dart';

class ProsesModel extends Equatable {
  final double? blackRice;
  final double? yellowRice;
  final double? whiteRice;
  final double? brokenRice;

  const ProsesModel({
    this.blackRice = 0,
    this.yellowRice = 0,
    this.whiteRice = 0,
    this.brokenRice = 0,
  });

  factory ProsesModel.fromJson(Map<String, dynamic> json) => ProsesModel(
        blackRice: json['beras_hitam'],
        yellowRice: json['beras_kuning'],
        whiteRice: json['beras_putih'],
        brokenRice: json['beras_patah'],
      );

  Map<String, dynamic> toJson() => {
        'beras_hitam': blackRice,
        'beras_kuning': yellowRice,
        'beras_putih': whiteRice,
        'beras_patah': brokenRice,
      };

  @override
  List<Object?> get props => [
        blackRice,
        yellowRice,
        whiteRice,
        brokenRice,
      ];
}
