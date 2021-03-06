grammar edu:umn:cs:melt:exts:ableC:vector:concretesyntax:copyConstructor;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:vector;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:vector:mda_test;

marking terminal CopyVector_t 'copy_vector' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'copy_vector' '(' e::AssignExpr_c ')'
  { top.ast = copyVector(e.ast, location=top.location); }