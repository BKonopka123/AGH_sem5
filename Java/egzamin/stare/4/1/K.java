class K {
    private static boolean b;
    char x = 'x';
    char getX() { return x;}
    public static void main(String[] args) {
        System.out.print( new K().b );
        System.out.print( new K().x );
        System.out.print( new K().getX() );
    }
}