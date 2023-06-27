import org.apache.spark.{SparkConf, SparkContext}

object jun2_2021 {
  def main(args: Array[String]): Unit = {
    val conf = new SparkConf().setAppName("app").setMaster("local[4]")
    val sc = new SparkContext(conf)

    val res = sc.textFile("dat/cars.csv")
      .map(x => {
        val spl = x.split(',')
        println(spl(3))
        (spl(0), spl(3), spl(4), spl(7), spl(8)) //drive, mpg, engine type, year, hp
      })
      .filter(x => {
        x._1 != "drive" && x._1 == "AWD" && x._4.toInt > 2010 && x._5.toInt > 300 && x._3 == "Gasoline"
      })  // treba i za brzine slicno ali mi chatgpt nije to generisao najbolje csv
      .map(x => x._2.toDouble)
      .mean()

    println(res + " mpg")
  }

}
