import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class Mapper2 extends Mapper<LongWritable, Text, Text, Text> {

  @Override
  public void map(LongWritable key, Text value, Context context)
      throws IOException, InterruptedException {

	  String line = value.toString();
	  	StringTokenizer tokenizer = new StringTokenizer(line);
	  	while (tokenizer.hasMoreTokens()){
	  		Text key1= new Text(tokenizer.nextToken());
	  		Text value1= new Text(tokenizer.nextToken());
	  		context.write(value1,key1);
	  	}
  }
}
