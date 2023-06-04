import org.apache.spark.{SparkConf, SparkContext}

import java.util.Scanner

object Main {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("app")
      .setMaster("local[4]")

    val sc = new SparkContext(conf)

    val scann = new Scanner(System.in)

    val n = scann.nextInt()

    val niz = (2 to n).toArray

    val nizRDD = sc.parallelize(niz)
      .filter(x => x % 2==0)
      .map(x=>x*x)
      .collect()
    sc.stop()

    println(nizRDD.mkString(", "))
  }
}
