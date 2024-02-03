class B extends A {
    B() { Tools.init("B()"); Tools.print(k, m); }
    int m = Tools.init("B.m");
    { m = Tools.init("B␣{␣}"); }
}