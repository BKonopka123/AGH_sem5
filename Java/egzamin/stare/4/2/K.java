class K
{
    static K x;
    protected K y;
    K() {
        x=y=this;
    }
    public static void main(String[] args) {
        System.out.println(x);
    }
}