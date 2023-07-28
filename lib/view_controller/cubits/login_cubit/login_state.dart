
abstract class LogInState{}
class LogInInitialState extends LogInState{}
class LogInSuccessState extends LogInState{}
class LogInErrorState extends LogInState{}
class LogInLoadingState extends LogInState{}
class LogInPasswordState extends LogInState{}
class VisiblePasswordState extends LogInState{}

class LogOutLoadingState extends LogInState{}
class LogOutSuccessState extends LogInState{}
class LogOutErrorState extends LogInState{}

