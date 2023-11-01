# Création d'apeçus de transformations xslt pour rapports dans Collections
`collections_xslt.py` prend deux arguments positionnels : le nom du fichier xml (dans `./xml`) et le nom du stylesheet xslt (dans `./xsl`). Par exemple, `python -m collections_xslt I18721.xml conditions.xsl` transformera les données dans `./xml/I18721.xml` en fonction de `./xsl/conditions.xsl`.
