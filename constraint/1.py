import constraint

problem = constraint.Problem()

problem.addVariable("a",range(10))

def foo(x,y,z): x+y+z > 5

problem.addConstraint()