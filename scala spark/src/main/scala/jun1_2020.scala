import org.apache.spark.{SparkConf, SparkContext}

object jun1_2020 {
  def main(args: Array[String]): Unit = {
    val sc = new SparkConf()
      .setAppName("app")
      .setMaster("local[4]")

    val s = new SparkContext(sc)

    val res = s.textFile("dat/insurance.csv")
      .map(x=> x.split(","))
      .filter(x=>x(5).compareToIgnoreCase("residential")==0)
      .filter(x=>x(6).compareToIgnoreCase("wood")==0)
      .filter(x=>x(2).compareToIgnoreCase("palm beach county")==0)
      .map(x=>(x(3).toDouble,x(4).toDouble,1))
      .reduce((a,b)=>(a._1+b._1,a._2+b._2,a._3+1))

    println(res._1/res._3,res._2/res._3)
  }
}
