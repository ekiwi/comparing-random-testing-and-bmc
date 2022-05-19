package chiseltest.formal.backends

import firrtl.AnnotationSeq
import firrtl.options.Dependency
import firrtl.stage.RunFirrtlTransformAnnotation

object PublicRunFlattenPass {
  def apply(): AnnotationSeq = Seq(RunFirrtlTransformAnnotation(Dependency(FlattenPass)))
}
