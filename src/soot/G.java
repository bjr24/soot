/* Soot - a J*va Optimization Framework
 * Copyright (C) 2003 Ondrej Lhotak
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

/*
 * Modified by the Sable Research Group and others 1997-1999.  
 * See the 'credits' file distributed with Soot for the complete list of
 * contributors.  (Soot is distributed at http://www.sable.mcgill.ca/soot)
 */

package soot;
import soot.coffi.*;
import java.io.PrintStream;
import java.util.*;
import soot.jimple.toolkits.pointer.util.NativeHelper;
import soot.jimple.spark.sets.P2SetFactory;
import soot.jimple.toolkits.invoke.*;
import soot.jimple.toolkits.pointer.UnionFactory;

/** A class to group together all the global variables in Soot. */
public class G extends Singletons 
{
    private static G instance = new G();
    public static G v() { return instance; }
    public static void reset() { instance = new G(); }

    public PrintStream out = System.out;

    public class Global {
    }

    public long coffi_BasicBlock_ids = 0;
    public Utf8_Enumeration coffi_CONSTANT_Utf8_info_e1 = new Utf8_Enumeration();
    public Utf8_Enumeration coffi_CONSTANT_Utf8_info_e2 = new Utf8_Enumeration();
    public int SETNodeLabel_uniqueId = 0;
    public HashMap SETBasicBlock_binding = new HashMap();
    public boolean ASTAnalysis_modified;
    public NativeHelper NativeHelper_helper = null;
    public P2SetFactory newSetFactory;
    public P2SetFactory oldSetFactory;
    public HashMap Parm_pairToElement = new HashMap();
    public int SparkNativeHelper_tempVar = 0;
    public boolean PointsToSetInternal_warnedAlready = false;
    public HashMap MethodPAG_methodToPag = new HashMap();
    public Set MethodRWSet_allGlobals = new HashSet();
    public Set MethodRWSet_allFields = new HashSet();
    public int GeneralConstObject_counter = 0;
    public UnionFactory Union_factory = null;
    public HashMap TypeSet_typeToNumber = null;
    public RefType[] TypeSet_numberToType = null;
    public TypeSet TypeSet_allTypes = null;
    public TypeSet TypeSet_libraryTypes = null;
    public TypeSet TypeSet_benchTypes = null;
    public HashMap Array2ndDimensionSymbol_pool = new HashMap();
    public Map AbstractUnit_allMapToUnnamed = Collections.unmodifiableMap(new AbstractUnitAllMapTo("<unnamed>"));
    public List Timer_outstandingTimers = new ArrayList();
    public boolean Timer_isGarbageCollecting;
    public Timer Timer_forcedGarbageCollectionTimer = new Timer("gc");
    public int Timer_count;
    public HashMap TypeGraphNode2_nameToNode = new HashMap(10000);
    public int TypeGraphNode2_counter = 0;
    public int TypeGraphNode2_tmpcount=0;
    public HashMap TypeSet2_typeToNumber = null;
    public TypeElement2[] TypeSet2_numberToType = null;
    public TypeSet2 TypeSet2_allTypes = null;
    public TypeSet2 TypeSet2_libraryTypes = null;
    public TypeSet2 TypeSet2_benchTypes = null;
    public HashMap TypeElement2_nameToType = new HashMap(500);
    public int TypeElement2_id;
    public final Map ClassHierarchy_classHierarchyMap = new HashMap();
}
