mash - Multiple Alignment Score HTML

<h2>Screenshot</h2>
<div><img alt="" src="https://raw2.github.com/alevchuk/mash/master/examples/mash-screenshot1.png" /></div>

INPUT:
--------
  ClustalW  - a standard format for storing multiple sequence alignments.
  or
  FASTA     - all sequences must have the same length. "-" represents a gap.

OUTPUT: 
--------
  HTML file    - contains sequences.
  JSON file(s) - highlighting info for 1 or more scoring methods.

REQUIREMENTS:
--------
  All code is written in R.
  Tested on: R version 2.12.0

  Required R libraries:
    * seqinr
    * rjson
    * Biostrings

  Results are viewable in a web browser.

FEATURES:
--------
  * Displays MSAs in HTML.
  * Integrates with many scoring methods.
  * Has a very compact HTML encoding.
  * Switches between multiple scoring methods seamlessly.

SCORING METHODS AVAILABLE:
--------
  * Gblocks official implementation
  * Gblocks unofficial open source implementation

RELATED WORK:
--------
  MView
    Source: http://bioweb2.pasteur.fr/docs/mview/

    """
    MView is a tool for converting the results of a sequence database search
    into the form of a coloured multiple alignment of hits stacked against the
    query. Alternatively, an existing multiple alignment can be processed.
    """
    * Can only highlight residues based on their Physico-Chemical Properties.
    * Uses <FONT> tags (in worst case 29 characters per residue)

  T-Coffee
    Source: http://www.tcoffee.org/Projects_home_page/m_coffee_home_page.html

    """T-Coffee is a multiple sequence alignment package."""
    * Highlights well-conserved residues.
    * In T-Coffee the HTML generator is coupled with the internal
      data-structures used generating the alignments.
    * Uses <span> tags (in worst case 26 characters per residue).

  GUIDANCE
    Source: http://guidance.tau.ac.il/

    """guide-tree based alignment confidence"""
    * Does MSA alignment (MAFFT, PRANK, or ClwstalW).
    * Offers scring with 2 methods: Guidance, and Heads-or-Tails.
    * Highlights in HTML according to score.
    * Uses <table> HTML construct (20 characters per residue).


RELATED WORK (non-HTML):
--------
  Belvu
    Source: http://sonnhammer.sbc.su.se/Belvu.html

    """Belvu is an X-windows viewer for multiple sequence alignments."""
    * Highlights well-conserved columns/residues.  

  Jalview
    Source: http://www.jalview.org/

    """Jalview is a multiple alignment editor written in Java."""

