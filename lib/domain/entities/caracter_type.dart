
enum CharacterType{
  heroes, villains, antiHeroes, aliens, humans
  
}
extension ParseToString on CharacterType {
  String name() {
    return toString().split('.').last;
  }
}