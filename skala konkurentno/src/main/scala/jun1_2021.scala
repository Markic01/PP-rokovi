import java.io.File
import java.util.Scanner
import java.util.concurrent.{ConcurrentHashMap}
import scala.collection.mutable.ArrayBuffer

class Nit(mapa: ConcurrentHashMap[Char, Int],
          lines: ArrayBuffer[String],
          from: Int,
          to: Int
         )
extends Thread{
  override def run(): Unit = {
    val x = new Array[Int](26)
    for (i <- 0 until 26)
      x(i)=0
    for (i<-from until to){
      for(j<- 0 until lines(i).length){
        val tmp: Char = lines(i)(j).toLower
        if (tmp >='a' && tmp <='z'){
          x(tmp.toInt - 97)+=1
        }
      }
    }

    mapa.synchronized{
      for(i <- 0 until 26){
        mapa.put((i+97).toChar, mapa.get((i+97).toChar)+x(i))
      }
    }
  }
}

object jun1_2021 {
  def main(args: Array[String]): Unit = {
    val sc1 = new Scanner(System.in)
    val sc2 = new Scanner(new File("dat/manifest.data"))

    val n = sc1.nextInt()
    sc1.nextLine()

    val lines = new ArrayBuffer[String]()

    while(sc2.hasNextLine){
      lines.append(sc2.nextLine())
    }

    val step = Math.ceil(lines.length/n.toDouble).toInt

    val niti = new Array[Nit](n)
    val mapa = new ConcurrentHashMap[Char, Int]()

    for(i <- 0 until 26){
      mapa.put((i+97).toChar,0)
    }

    for (i <- 0 until n){
      niti(i) = new Nit(mapa, lines, i*step, Math.min((i+1)*step,lines.length))
    }
    niti.foreach(_.start())
    niti.foreach(_.join())

    println(mapa)
  }
}
