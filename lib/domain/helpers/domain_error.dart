

enum DomainError {
  unexpected, 
  invalidCredetials
}

extension DomainErrorExtension on DomainError {
  String get description {
    switch(this){
      case DomainError.invalidCredetials: return 'Credenciais invalidas.';
      default: return 'Algo errado aconteceu tente novamente em breve.';
    }
  }
}