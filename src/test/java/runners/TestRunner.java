package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runFirstTest(){
        return Karate.run("../features/SecondTest").relativeTo(getClass());
    }
}
