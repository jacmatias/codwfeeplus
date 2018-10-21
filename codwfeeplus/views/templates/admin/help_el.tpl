{** Copyright 2018 Sakis Gkiokas
*
* This file is part of codwfeeplus module for Prestashop.
*
* Codwfeeplus is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Codwfeeplus is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* For any recommendations and/or suggestions please contact me
* at sakgiok@gmail.com
*
*  @author    Sakis Gkiokas <sakgiok@gmail.com>
*  @copyright 2018 Sakis Gkiokas
*  @license   https://opensource.org/licenses/GPL-3.0  GNU General Public License version 3
*}

{if $help_ajax == true}
    <link rel="stylesheet" type="text/css" href="{$css_file}" />
{/if}
{if $help_ajax == false}
    <div class="bootstrap" id="codwfeeplushelpblock">
        <div class="panel">
            <div class="panel-heading" onclick="$('#codwfeeplus_help_panel').slideToggle();">
                <i class="icon-question"></i>
                {$help_title|escape:'htmlall':'UTF-8'}  <span style="text-transform: none;font-style: italic;">({$help_sub|escape:'htmlall':'UTF-8'})</span>
                {if $update.res == 'update'}
                    &nbsp;<span class="codwfeeplus_update_title_success">ΒΡΕΘΗΚΕ ΜΙΑ ΕΝΗΜΕΡΩΣΗ!</span>
                {elseif $update.res == 'current'}
                    &nbsp;<span class="codwfeeplus_update_title_current">ΔΕΝ ΒΡΕΘΗΚΕ ΕΝΗΜΕΡΩΣΗ!</span>
                {elseif $update.res == 'error'}
                    &nbsp;<span class="codwfeeplus_update_title_error">ΣΦΑΛΜΑ ΚΑΤΑ ΤΟΝ ΕΛΕΓΧΟ ΕΝΗΜΕΡΩΣΗΣ!</span>
                {/if}
            </div>
        {/if}
        <div id="codwfeeplus_help_panel"{if $help_ajax == false && $hide == true} style="display: none;"{/if}>
            <div class="codwfeeplus_update">
                {if $update.res != '' && $update.res != 'error'}
                    {if $update.res =='current'}
                        <div class="codwfeeplus_update_out_current">
                            <p>Το πρόσθετο είναι ενημερωμένο στην τελευταία έκδοση.</p>
                        </div>
                    {elseif $update.res=='update'}
                        <div class="codwfeeplus_update_out_success">
                            <p>Μια νέα ενημέρωση είναι διαθέσιμη: <a href="{$update.download_link}">{$update.download_link}</a> </p>
                        </div>
                    {/if}
                {elseif $update.res == 'error'}
                    <div class="codwfeeplus_update_out_error">
                        <p>Σφάλμα κατά τον έλεγχο για ενημέρωση: {$update.out}</p>
                    </div>
                {/if}
                <div class="codwfeeplus_update_form">
                    <form action="{$href}" method="post">
                        <button type="submit" name="codwfeeplus_check_update">
                            <i class="icon-refresh"></i>
                            Έλεγχος για ενημέρωση
                        </button>
                    </form>
                </div>
            </div>
            <div class="codwfeeplus_help_title">
                <p>{$module_name|escape:'htmlall':'UTF-8'} - v{$module_version|escape:'htmlall':'UTF-8'}</p>
            </div>
            <div class="codwfeeplus_help_body">
                <p>Αυτή η ενότητα σάς επιτρέπει να χρησιμοποιήσετε τη μέθοδο πληρωμής με αντικαταβολή (COD), προσθέτοντας μια χρέωση όταν πληρούνται οι κατάλληλες προϋποθέσεις.</p>
                <p>Μπορείτε να εισάγετε τις συνθήκες που χρειάζεστε στην παρακάτω λίστα, οι οποίες περιλαμβάνουν τις ακόλουθες παραμέτρους:</p>
                <ul>
                    <li>Το κατάστημα.</li>
                    <li>Τον μεταφορέα που επέλεξε ο πελάτης.</li>
                    <li>Τη χώρα της διεύθυνσης παράδοσης.</li>
                    <li>Τη ζώνη της χώρας της διεύθυνσης παράδοσης.</li>
                    <li>Τη κατηγορία τουλάχιστον ενός από τα προϊόντα.</li>
                    <li>Τη συνολική αξία του καλαθιού, πάνω ή κάτω από μια τιμή.</li>
                    <li>Το γκρουπ στο οποίο ανήκει ο πελάτης.</li>
                </ul>
                <p>Κάθε φορά που πληρούνται μια προϋπόθεση, υπολογίζεται ένα τέλος σύμφωνα με τους κανόνες της. Η λογική που υπολογίζεται είναι:</p>
                <ul>
                    <li>Εάν έχετε επιλέξει έναν ή περισσότερα καταστήματα στη συνθήκη, ελέγχει αν το επιλεγμένο κατάστημα βρίσκεται στα επιλεγμένα καταστήματα της συνθήκης.</li>
                    <li>Εάν έχετε επιλέξει έναν ή περισσότερους μεταφορείς στη συνθήκη, ελέγχει αν ο επιλεγμένος μεταφορέας βρίσκεται στους επιλεγμένους μεταφορείς της συνθήκης.</li>
                    <li>Εάν έχετε επιλέξει μία ή περισσότερες χώρες στη συνθήκη, ελέγχει εάν η χώρα παράδοσης βρίσκεται στις επιλεγμένες χώρες της συνθήκης.</li>
                    <li>Αν έχετε επιλέξει μία ή περισσότερες ζώνες στη συνθήκη, ελέγχει εάν η ζώνη της χώρας παράδοσης βρίσκεται στις επιλεγμένες ζώνες της συνθήκης.</li>
                    <li>Αν έχετε επιλέξει ένα ή περισσότερα γκρουπ στη συνθήκη, ελέγχει εάν τα γκρουπ που ανήκει ο πελάτης βρίσκεται στα επιλεγμένα γκρουπ της συνθήκης.</li>
                    <li>Αν έχετε επιλέξει μία ή περισσότερες κατηγορίες στη συνθήκη, ελέγχει εάν τουλάχιστον μία από τις κατηγορίες προϊόντων ταιριάζει με τις επιλεγμένες κατηγορίες της συνθήκης.</li>
                    <li>Αν έχετε καθορίσει μια αξία καλαθιού διαφορετική από 0, ελέγχει αν η αξία του καλαθιού του πελάτη είναι χαμηλότερη ή μεγαλύτερη (ανάλογα με τι έχετε επιλέξει) από την αποθηκευμένη αξία καλαθιού.</li>
                    <li>Εάν όλα τα παραπάνω είναι αληθές, υπολογίζεται η χρέωση, είτε χωρίς χρέωση, σταθερή χρέωση, ποσοστό της συνολικής αξίας του καλαθιού ή σταθερή και ποσοστό μαζί.</li>
                    <li>Εάν μία από τις τιμές min και max δεν είναι 0 και η μέθοδος υπολογισμού των τελών είναι είτε ποσοστιαία είτε σταθερή και ποσοστιαία, η υπολογισμένη χρέωση περιορίζεται σε αυτές τις τιμές.</li>
                </ul>
                <p>Όταν ενεργοποιηθεί η επιλογή "Καταγραφή παραγγελιών" θα κρατηθεί αρχείο όλων των παραγγελιών που έγιναν με αυτή τη μέθοδο πληρωμής, περιλαμβανομένων και των βημάτων υπολογισμού της χρέωσης. Μπορείτε να έχετε πρόσβαση στη λίστα αυτή πατώντας το κουμπί "Εμφάνιση καταγραφής παραγγελιών".</p>
                <p>Η επιλογή "Συμπεριφορά" ορίζει τι θα κάνει το πρόσθετο όταν μια συνθήκη είναι αληθής. Όταν είναι επιλεγμένο το "Εφαρμόστε τη πρώτη χρέωση που ταιριάζει", το οποίο είναι και το προεπιλεγμένο, η διαδικασία θα σταματήσει αμέσως μόλις βρεθεί μια συνθήκη που ταιριάζει (και η σειρά με την οποία εξετάζονται οι συνθήκες είναι ανάλογα τη θέση τους - πρώτη η πιο ψηλά στη λίστα). Αν είναι επιλεγμένο το "Προσθέστε όλες τις χρεώσεις που ταιριάζουν", θα εξεταστούν όλες οι συνθήκες και όλες οι χρεώσεις από τις συνθήκες που είναι είναι αληθής, θα προστεθούν να υπολογιστεί η τελική χρέωση.</p>
                <p>Η επιλογή "Ενσωμάτωση" καθορίζει τον τρόπο εμφάνισης της χρέωσης στον πελάτη. Οι επιλογές είναι να το εμφανίσετε ως προϊόν στην παραγγελία του πελάτη, να το προσθέσετε στην αμοιβή του μεταφορέα ή να χρησιμοποιήσετε τον τρόπο που είναι αποθηκευμένος στην πρώτη συνθήκη που θα επικυρωθεί (Σημειώνεται ότι αν η τελική χρέωση είναι μηδέν, χρησιμοποιείται πάντα ο τρόπος χρέωσης στα μεταφορικά, ο οποίος για τιμή χρέωσης μηδέν, δεν έχει καμιά επίπτωση στη τελική παραγγελία). Αν χρησιμοποιηθεί ο τρόπος του προϊόντος στη παραγγελία, μπορείτε με τα αντίστοιχα πεδία, να ορίσετε το όνομα του προϊόντος καθώς και τον κωδικό αναφοράς του.</p>
                <p>Εάν η τελική μέθοδος ενσωμάτωσης είναι προϊόν αντικαταβολής, θα χρησιμοποιηθεί ως φόρος για τη χρέωση αντικαταβολής, αυτός που είναι αποθηκευμένος στην πρώτη συνθήκη που επικυρώθηκε. Σημειώνεται ότι ο φόρος δεν έχει κάμία επίπτωση στην τελική χρέωση αλλά εμφανίζεται στο τιμολόγιο.</p>
                <p>Ορίζοντας την επιλογή "Αντιστοίχιση όλων" σε γκρουπ ή κατηγορίες, ορίζετε ότι, κατά την επικύρωση μιας συνθήκης, όλες οι παρεχόμενες κατηγορίες και/ή γκρουπ πρέπει να ταιριάζουν με αυτές που ορίζονται στη συνθήκη. Εάν οι επιλογές δεν είναι ενεργοποιημένες, εάν κάποια από τις παρεχόμενες ομάδες/κατηγορίες ταιριάζει με τουλάχιστον ένα από τα αντίστοιχα κριτήρια που παρέχονται από την συνθήκη, η συνθήκη θα επικυρωθεί, όσον αφορά τις ομάδες/κατηγορίες.</p>
                <p>Μπορείτε να ελέγξετε τις συνθήκες, καθορίζοντας τις επιθυμητές τιμές ενός καροτσιού στην παρακάτω φόρμα και θα λάβετε τη συνολική χρέωση και τις συνθήκες που επαληθεύονται με αυτές τις τιμές.</p>
                <p>Σε περίπτωση που θέλετε να επαναφέρετε το προϊόν της αντικαταβολής, μπορείτε να πατήσετε το αντίστοιχο κουμπί. Αυτό θα σβήσει το προϊόν από τη βάση (αν υπάρχει) και θα εισάγει ένα καινούργιο. Μια περίπτωση που μπορεί να το χρειαστείτε, είναι εάν σβήσετε κατά λάθος το προϊόν από τη λίστα προϊόντων.</p>
                <p>Για οποιεσδήποτε ερωτήσεις ή συστάσεις μπορείτε να επικοινωνήσετε μαζί μου στο sakgiok (at) gmail.com</p>
                <p>Περισσότερες λεπτομέρειες μπορείτε να βρείτε στη σελίδα του πρόσθετου: <a href="{$update.info_link}" target="_blank">{$update.info_link}</a></p>
            </div>
            <div class="codwfeeplus_donate_body">
                <p>Αυτό το πρόσθετο είναι εντελώς δωρεάν και μπορείτε να το χρησιμοποιήσετε χωρίς κανένα περιορισμό. Στην περίπτωση πάντως που θέλετε να με κεράσετε μια μπύρα, μπορείτε να χρησιμοποιήσετε το παρακάτω κουμπί.</p>
                <div class="codwfeeplus_donate_form">
                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                        <input type="hidden" name="cmd" value="_s-xclick">
                        <input type="hidden" name="hosted_button_id" value="94VTWMDKGAFX4">
                        <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                    </form>
                </div>
            </div>
        </div>
        {if $help_ajax == false}
        </div>
    </div>
{/if}