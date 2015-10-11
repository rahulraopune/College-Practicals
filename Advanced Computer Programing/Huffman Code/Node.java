public class Node implements Comparable<Node> {
	
	Node left;
    Node right;
    Node parent;
	String name;
	int frequency;
	
	public Node(String s, int n) {
	    this.name = s;
	    this.frequency = n;
	}
	
	public Node(int n) {
	    this.name = "";
	    this.frequency = n;
	}
	
	public String getString() {
	    return name;
	}
	
	public void setFreq(int n) {
	    this.frequency = n;
	}
	
	public int compareTo(Node f2) {
		return frequency < f2.frequency ? -1 : (frequency == f2.frequency ? 0 : 1);
	}
}

