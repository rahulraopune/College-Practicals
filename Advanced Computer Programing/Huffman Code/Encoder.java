import java.util.ArrayList;
import java.util.PriorityQueue;

public class Encoder {
	
	public ArrayList<String> huffman = new ArrayList<String>();
	
	public ArrayList<Node> calculateFrequency(String text) {
	    ArrayList<Node> al = new ArrayList<Node>();
	    for (int i = 0; i < text.length(); i++) {
			char c = text.charAt(i);
			Node n;
			try {
				n = al.get(i);
				n.frequency += 1;
			} catch (IndexOutOfBoundsException e) {
				n = new Node(Character.toString(c), 1);
				al.add(n);
			}
		}
	    return al;
	}
	
	public void printFromPreOrder(Node n, String dashes) {
		// Start recursive on left child then right
		if (n.left != null) {
            printFromPreOrder(n.left, dashes + "0");
        }
        if (n.right != null) {
            printFromPreOrder(n.right, dashes + "1");
        }
        // print with colon if leaf node
        if (n.name != "") {
        	huffman.add(n.name + ":" + dashes);
        }
    }

    // Returns root node to pass to printFromPreOrder
    public Node makeHuffmanTree(ArrayList<Node> nodes) {
        PriorityQueue<Node> queue = new PriorityQueue<Node>();
        queue.addAll(nodes);
        Node root = null;
        while (queue.size() > 1)  {
            Node least1 = queue.poll();
            Node least2 = queue.poll();
            Node combined = new Node(least1.frequency + least2.frequency);
            combined.right = least1;
            combined.left = least2;
            least1.parent = combined;
            least2.parent = combined;
            queue.add(combined);
            // Keep track until we actually find the root
            root = combined;
        }
        return root;
    }
    
}
