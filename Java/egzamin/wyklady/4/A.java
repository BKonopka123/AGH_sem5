class A {
    A() { Tools.init("A()"); }
    { k = Tools.init("A␣{␣}"); }
    int k = Tools.init("A.k");
}
