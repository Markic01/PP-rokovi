import org.apache.spark.{SparkConf, SparkContext}

object jun1_2021 {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf()
      .setAppName("app")
      .setMaster("local[4]")

    val sc = new SparkContext(conf)

    val res = sc
      .textFile("dat/billionaires.csv")
      .map(x => {
        val spl = x.split(",")
        (spl(0),spl(1),spl(4),spl(5))
      }) //(ime, rang, godine, pol)
      .filter(x => x._4.compareTo("male") == 0)
      .filter(x=> x._2.toInt <= 50)
      .map(x => x._3.toInt)
      .mean()

    sc.stop()

    println(res)
  }
}
