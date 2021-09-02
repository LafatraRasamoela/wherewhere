/*! afahana maka donne en fonction lieu et province*/
CREATE OR REPLACE VIEW  lieuProvLocal AS
    SELECT li.*, p.*, 
        lo.nomLocalisation, lo.imageLocalisation
        FROM lieu li, province p, localisation lo
        WHERE  lo.idLocalisation = li.idLocalisation
            AND p.idProvince = lo.idProvince;
                