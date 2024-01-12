import java.util.ArrayList;
import java.util.ListIterator;
import java.util.Random;

public class Zad {
    ArrayList<Integer> list = new ArrayList<Integer>();
    ArrayList<Boolean> visited = new ArrayList<Boolean>();
    ListIterator<Integer> it;

    public Zad() {}

    public void fill(){
        Random rand = new Random();
        for(int i=0; i<40; i++){
            list.add(rand.nextInt(100));
        }
    }

    public void print(){
        for(Integer i : list){
            System.out.print(i + " ");
        }
        System.out.println();
    }

    public void forward_it(){
        it = list.listIterator();
        while(it.hasNext()){
            Integer tmp = it.next();
            if(tmp % 2 == 1){
                visited.add(true);
                it.set(tmp+1);
            }
            else{
                visited.add(false);  
            }
        }
    }

    public void backward_it(){
        it = list.listIterator(list.size());
        while(it.hasPrevious()){
            Integer tmp = it.previous();
            Integer index = it.previousIndex() + 1;
            if(!visited.get(index)){
                it.set(tmp+1);
            }
        }
    }
}
