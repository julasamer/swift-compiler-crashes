func initializer(clos: () -> () ) -> String {
  return ""
}

class Crash 
{
  var _ = initializer() {}
}

