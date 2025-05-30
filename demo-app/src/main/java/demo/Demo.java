package demo;

import io.temporal.workflow.WorkflowInterface;
import io.temporal.workflow.WorkflowMethod;

@WorkflowInterface
public interface Demo {
    
    @WorkflowMethod
    String greetSomeone(String name);

}
