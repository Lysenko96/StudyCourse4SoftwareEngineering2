import java.util.TreeSet;

public class Source
{
    public static void main(String[] args)
    {
        new Source();
    }
    private Source()
    {
        TreeSet<String> treeSet = new TreeSet<>();
        treeSet.add("java");
        treeSet.add("vision");
        treeSet.add("vision");

        for(String s : treeSet)
        {
            System.out.println(s);
        }

        int size = treeSet.size();
        System.out.println("size = " + size);

        String first = treeSet.first();
        System.out.println(first);

        String last = treeSet.last();
        System.out.println(last);

        boolean con1 = treeSet.contains("java");
        System.out.println(con1);
        boolean con2 = treeSet.contains("jav");
        System.out.println(con2);

        treeSet.remove("java");
        for(String s : treeSet)
        {
            System.out.println(s);
        }

    }
}
