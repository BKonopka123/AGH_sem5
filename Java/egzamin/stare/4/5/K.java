class K {
    public static void main(String[] args) {
        int[] k = new int[3];
        int i = 0;
        for (int n : k) {
            n = i++;
        }
        for (int n : k) {
            System.out.print(n + ", ");
        }
    }
}