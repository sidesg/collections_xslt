from saxonche import PySaxonProcessor
from pathlib import Path
import argparse

class Xslt_proc():
    def __init__(self, stylesheet) -> None:
        self.stylesheet = stylesheet
        self.proc = PySaxonProcessor(license = False)
        self.nuproc = self.proc.new_xslt30_processor()
        self.xform = self.nuproc.compile_stylesheet(stylesheet_file=self.stylesheet)
    
def transform(processor: Xslt_proc, infile: str) -> None:
    htmlpath = Path("html")
    if not htmlpath.exists():
        htmlpath.mkdir()
    outfname = htmlpath / f'{Path(infile).stem}_done.html'
    doc = processor.proc.parse_xml(xml_file_name=infile)
    out = processor.xform.transform_to_string(xdm_node=doc)
    with open(outfname, 'w', encoding="utf-8") as f:
        f.write(out)

def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("data")
    parser.add_argument("xslt")
    args = parser.parse_args()

    xml_path = f'xml/{args.data}'
    xsl_path = f"xsl/{args.xslt}"

    P = Xslt_proc(xsl_path)
    transform(P, xml_path)
    
if __name__ == "__main__":
    main()