name := "bug-mining-instrumentation"
version := "0.1"
scalaVersion := "2.13.8"

scalacOptions ++= Seq(
  "-language:reflectiveCalls",
  "-deprecation",
  "-feature",
  "-Xcheckinit",
)

// SNAPSHOT repositories
libraryDependencies += "edu.berkeley.cs" %% "firrtl" % "1.5.2"
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.2"

Compile / scalaSource := baseDirectory.value / "src"
Compile / resourceDirectory := baseDirectory.value / "src" / "resources"
Test / scalaSource := baseDirectory.value / "test"

// use `sbt assembly` to build a fat jar
assemblyJarName in assembly := "firrtl.jar"
test in assembly := {}
assemblyOutputPath in assembly := file("./utils/bin/firrtl.jar")
