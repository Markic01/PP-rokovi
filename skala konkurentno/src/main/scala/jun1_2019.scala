import java.io.File
import java.util.Scanner
import java.util.concurrent.ConcurrentLinkedQueue

class Find(lines: ConcurrentLinkedQueue[String],
           length: Int,
          pattern: String
         ) extends Thread{
  override def run(): Unit = {
    for(_ <- 0 until length){
      val fileName = lines.poll()
      val sc: Scanner = new Scanner(new File(fileName))
      var i: Int = 0
      while(sc.hasNextLine){
        i=i+1
        val s = sc.nextLine()
        if(s.indexOf(pattern) != -1){
          println(fileName+": "+i)
        }
      }
    }
    println("Nit "+this.getId + " je zavrsila sa radom")
  }
}

object Pronalazak {
  def main(args: Array[String]): Unit = {
    val sc1: Scanner = new Scanner(System.in)
    val sc2: Scanner = new Scanner(new File("dat/fajlovi.txt"))

    val lines = new ConcurrentLinkedQueue[String]()

    while (sc2.hasNextLine){
      lines.add(sc2.nextLine())
    }

    val pattern: String = sc1.next()
    sc1.nextLine()
    val n:Int = sc1.nextInt()

    val niti: Array[Find] = new Array[Find](n)
    val step: Int = Math.ceil(lines.size().toDouble / n.toDouble).toInt

    for(i <- 0 until n-1){
      niti(i) = new Find(lines,step,pattern)
    }
    niti(n-1) = new Find(lines,lines.size()-step*(n-1),pattern)

    for(i <- 0 until n){
      niti(i).start()
    }
    for (i <- 0 until n) {
      niti(i).join()
    }
  }
}
