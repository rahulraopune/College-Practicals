import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
public class Driver {

  @SuppressWarnings("deprecation")
public static void main(String[] args) throws Exception {

	int argl=args.length;
    if (args.length != 2) {
      System.out.printf("Usage: Driver <input dir> <output dir>\n");
      System.exit(-1);
    }
    Job job = new Job();
    job.setJarByClass(Driver.class);
    
    job.setJobName("hc Driver");

    job.setMapperClass(Mapper1.class);
    job.setCombinerClass(Reducer1.class);
    job.setReducerClass(Reducer1.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    job.setOutputFormatClass(TextOutputFormat.class);
    job.setInputFormatClass(TextInputFormat.class);
    TextOutputFormat.setOutputPath(job, new Path("OUTPUT3"));
    TextInputFormat.setInputPaths(job, new Path(args[0]));
   

    job.waitForCompletion(true);
    Job job2 = new Job();
    job2.setJarByClass(Driver.class);

    job2.setMapperClass(Mapper2.class);
    job2.setCombinerClass(Reducer2.class);
    job2.setReducerClass(Reducer2.class);
    job2.setOutputKeyClass(Text.class);
    job2.setOutputValueClass(Text.class);
    job2.setOutputFormatClass(TextOutputFormat.class);
    job2.setInputFormatClass(TextInputFormat.class);
    TextOutputFormat.setOutputPath(job2, new Path(args[1]));
    TextInputFormat.setInputPaths(job2, new Path("OUTPUT3"));
    boolean success = job2.waitForCompletion(true);
    System.exit(success ? 0 : 1);
  }
}

