import org.apache.spark.{SparkConf, SparkContext}

object jun1_2019 {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf().setAppName("app").setMaster("local[4]")

    val sc = new SparkContext(conf)

    val resW = sc.textFile("dat/biostats.csv")
      .map(x=>x.split(","))
      .filter(x=> x(1).compareToIgnoreCase("f")==0)
      .map(x=>(x(3).toDouble*2.54,1))
      .fold((0.0,0))((acc,b)=>(acc._1+b._1,acc._2+b._2))

    val resM = sc.textFile("dat/biostats.csv")
      .map(x => x.split(","))
      .filter(x => x(1).compareToIgnoreCase("m") == 0)
      .map(x => (x(4).toDouble*0.453, 1))
      .fold((0.0, 0))((a, b) => (a._1 + b._1, a._2 + b._2))

    sc.stop()

    println("F: "+resW._1/resW._2.toDouble + " cm")
    println("M: "+resM._1/resM._2+ " kg")
  }
}
