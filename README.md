mash - Multiple Alignment Score HTML

FEATURES
--------
- Displays multiple sequence alignments in HTML
- Has a compact HTML encoding (8 characters per residue)
- Integrates with many scoring methods
- Handles large MSAs

SCREENSHOTS
-----------
<img alt="" src="https://raw2.github.com/alevchuk/mash/master/examples/mash-screenshot1.png" />
<img alt="" src="https://raw2.github.com/alevchuk/mash/master/examples/mash-screenshot2.png" />

INPUT
-----
- ClustalW  - a standard format for storing multiple sequence alignments
or
- FASTA     - all sequences must have the same length. Dash "-" represents a gap

OUTPUT 
------
- HTML file    - contains sequences
- JSON file(s) - results for 1 or more scoring methods

REQUIREMENTS
------------
- R version 2.12.0 or higher
- seqinr (R library)
- rjson (R library)
- Biostrings (R library)


SCORING METHODS AVAILABLE
--------
- Gblocks official implementation <a href="http://molevol.cmima.csic.es/castresana/Gblocks_server.html">Link to website</a>
- Gblocks unofficial open source implementation
- NorMD <a href="http://www.ncbi.nlm.nih.gov/pubmed/11734009">Link to Publication</a>
- Substitution-matrix (e.g. BLOSUM100) column highlighter

RELATED WORK
--------
### MView
http://bioweb2.pasteur.fr/docs/mview/

    """
    MView is a tool for converting the results of a sequence database search
    into the form of a coloured multiple alignment of hits stacked against the
    query. Alternatively, an existing multiple alignment can be processed.
    """

* Can only highlight residues based on their Physico-Chemical Properties.
* Uses `<FONT>` HTML tags (29 characters per residue)

### T-Coffee
http://www.tcoffee.org/Projects_home_page/m_coffee_home_page.html

    """T-Coffee is a multiple sequence alignment package."""
    
* Highlights well-conserved residues
* In T-Coffee the HTML generator is coupled with the internal data-structures used for generating the alignments
* Uses `<span>` HTML tags (26 characters per residue)

### GUIDANCE
http://guidance.tau.ac.il/

    """guide-tree based alignment confidence"""
    
* Does MSA alignment (MAFFT, PRANK, or ClwstalW)
* Offers scoring with 2 methods: Guidance, and Heads-or-Tails
* Highlights in HTML according to score
* Uses `<table>` HTML tags (20 characters per residue)

### Belvu
http://sonnhammer.sbc.su.se/Belvu.html

    """Belvu is an X-windows viewer for multiple sequence alignments."""
    
* Not HTML
* Highlights well-conserved columns/residues

### Jalview
http://www.jalview.org/

    """Jalview is a multiple alignment editor written in Java."""

* Not HTML
