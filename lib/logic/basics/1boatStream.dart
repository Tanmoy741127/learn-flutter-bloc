Stream<int> boatSteam() async*{
  for (var i = 0; i < 10; i++) {
    print("Sending boat no : "+ i.toString());
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatSteam();
  stream.listen((data) {
    print("Received boat no : "+ data.toString());
  });
  print("Ended");
}