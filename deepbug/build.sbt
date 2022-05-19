name := "deepbug"
version := "0.1"
scalaVersion := "2.13.7"

scalacOptions ++= Seq(
  "-language:reflectiveCalls",
  "-deprecation",
  "-feature",
  "-Xcheckinit",
  "-Ymacro-annotations",
)

// SNAPSHOT repositories
resolvers += Resolver.sonatypeRepo("snapshots")

libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.6-SNAPSHOT"
addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.6-SNAPSHOT" cross CrossVersion.full)
libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.6" % Test
libraryDependencies += "com.lihaoyi" %% "upickle" % "1.4.4"

Compile / scalaSource := baseDirectory.value / "src"
Test / scalaSource := baseDirectory.value / "test"
Test / resourceDirectory := baseDirectory.value / "test" / "resources"
