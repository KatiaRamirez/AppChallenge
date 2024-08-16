import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetHomeData extends HomeEvent {
  const GetHomeData();
  
  @override
  List<Object> get props => [];

}