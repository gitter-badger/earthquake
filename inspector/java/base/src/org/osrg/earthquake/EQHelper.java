
import org.osrg.earthquake.*;
import java.util.*;
import org.jboss.byteman.rule.*;
import org.jboss.byteman.rule.helper.*;

public class EQHelper extends Helper
{
    static org.osrg.earthquake.Inspector inspector;
    static {
    	inspector = new org.osrg.earthquake.Inspector();
    };

    public EQHelper(Rule rule) {
    	super(rule);
    }

    public static void activated() {
	inspector.Initiation();
	// System.out.println("BTM: initiation to orchestrator completed");
    }

    public static void deactivated() {
        //stopThread();
    }

    public void eventFuncCall(String name) {
	inspector.EventFuncCall(name);
    }

    public void eventFuncCall(String name, Map<String, Object> argMap) {
	inspector.EventFuncCall(name, argMap);
    }

    public void stopInspection() {
	inspector.StopInspection();
    }
}

