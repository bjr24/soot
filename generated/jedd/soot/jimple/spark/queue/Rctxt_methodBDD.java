package soot.jimple.spark.queue;

import soot.util.*;
import soot.jimple.spark.bdddomains.*;
import soot.jimple.spark.*;
import soot.jimple.toolkits.callgraph.*;
import soot.*;
import soot.util.queue.*;
import jedd.*;
import java.util.*;

public final class Rctxt_methodBDD extends Rctxt_method {
    private final jedd.internal.RelationContainer bdd =
      new jedd.internal.RelationContainer(new Attribute[] { ctxt.v(), method.v() },
                                          new PhysicalDomain[] { V1.v(), T1.v() },
                                          ("private <soot.jimple.spark.bdddomains.ctxt:soot.jimple.spark" +
                                           ".bdddomains.V1, soot.jimple.spark.bdddomains.method:soot.jim" +
                                           "ple.spark.bdddomains.T1> bdd at /home/olhotak/soot-2-jedd/sr" +
                                           "c/soot/jimple/spark/queue/Rctxt_methodBDD.jedd:31,12-32"));
    
    void add(final jedd.internal.RelationContainer tuple) { bdd.eqUnion(tuple); }
    
    public Rctxt_methodBDD(final jedd.internal.RelationContainer bdd) {
        this();
        this.add(new jedd.internal.RelationContainer(new Attribute[] { ctxt.v(), method.v() },
                                                     new PhysicalDomain[] { V1.v(), T1.v() },
                                                     ("this.add(bdd) at /home/olhotak/soot-2-jedd/src/soot/jimple/s" +
                                                      "park/queue/Rctxt_methodBDD.jedd:33,65-68"),
                                                     bdd));
    }
    
    Rctxt_methodBDD() {
        super();
        bdd.eq(jedd.internal.Jedd.v().falseBDD());
    }
    
    public Iterator iterator() {
        ;
        return new Iterator() {
            private Iterator it;
            
            public boolean hasNext() {
                if (it != null && it.hasNext()) return true;
                if (!jedd.internal.Jedd.v().equals(jedd.internal.Jedd.v().read(bdd), jedd.internal.Jedd.v().falseBDD()))
                    return true;
                return false;
            }
            
            public Object next() {
                if (it == null || !it.hasNext()) {
                    it =
                      new jedd.internal.RelationContainer(new Attribute[] { ctxt.v(), method.v() },
                                                          new PhysicalDomain[] { V1.v(), T1.v() },
                                                          ("bdd.iterator(new jedd.Attribute[...]) at /home/olhotak/soot-" +
                                                           "2-jedd/src/soot/jimple/spark/queue/Rctxt_methodBDD.jedd:45,2" +
                                                           "5-28"),
                                                          bdd).iterator(new Attribute[] { ctxt.v(), method.v() });
                    bdd.eq(jedd.internal.Jedd.v().falseBDD());
                }
                Object[] components = (Object[]) it.next();
                return new Tuple((Context) components[0], (SootMethod) components[1]);
            }
            
            public void remove() { throw new UnsupportedOperationException(); }
        };
    }
    
    public jedd.internal.RelationContainer get() {
        final jedd.internal.RelationContainer ret =
          new jedd.internal.RelationContainer(new Attribute[] { ctxt.v(), method.v() },
                                              new PhysicalDomain[] { V1.v(), T1.v() },
                                              ("<soot.jimple.spark.bdddomains.ctxt:soot.jimple.spark.bdddoma" +
                                               "ins.V1, soot.jimple.spark.bdddomains.method:soot.jimple.spar" +
                                               "k.bdddomains.T1> ret = bdd; at /home/olhotak/soot-2-jedd/src" +
                                               "/soot/jimple/spark/queue/Rctxt_methodBDD.jedd:55,29-32"),
                                              bdd);
        bdd.eq(jedd.internal.Jedd.v().falseBDD());
        return new jedd.internal.RelationContainer(new Attribute[] { ctxt.v(), method.v() },
                                                   new PhysicalDomain[] { V1.v(), T1.v() },
                                                   ("return ret; at /home/olhotak/soot-2-jedd/src/soot/jimple/spa" +
                                                    "rk/queue/Rctxt_methodBDD.jedd:57,8-14"),
                                                   ret);
    }
    
    public boolean hasNext() {
        return !jedd.internal.Jedd.v().equals(jedd.internal.Jedd.v().read(bdd), jedd.internal.Jedd.v().falseBDD());
    }
}