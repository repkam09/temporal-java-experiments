package demo;


public class DemoImpl implements Demo {
    
    @Override
    public String greetSomeone(String name) {
        return "Hello, " + name + "!";
    }
}
