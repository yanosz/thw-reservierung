# encoding: utf-8
class Rental < ActiveRecord::Base
  belongs_to :subject
  validates_presence_of :subject_id, :message => "Kein Gegenstand ausgewählt"
  validates_presence_of :user, :message => "Kein Benutzer angegeben"
  validates_presence_of :from_date, :message => "Kein Startzeitpunkt ausgewählt"
  validates_presence_of :to_date, :message => "Kein Endzeitpunkt ausgewählt"
  validate :collisions
  validate :from_validate
  validate :to_validate
  
  def from_validate
    errors.add(:from_date, "Beginn darf nicht in der Vergangenheit liegen") if  self.from_date && self.from_date < (Time.now + 600) 
  end
  def to_validate
    errors.add(:to_date, "Ende darf nicht der der Vergangenheit liegen") if self.to_date && self.to_date < DateTime.now 
    erros.add(:to_date, "Eine Reservierung kann nicht enden bevor sie begonnen hat") if self.to_date && self.from_date && self.to_date < self.from_date  
  end
  
  def collisions
    #Finde Collisionen.
    cand = []
    #1. Runde: Alle Rentals die vorher beginnen und hinterher enden
    cand += Rental.find(:all, :conditions => ["user <> ? AND subject_id = ? AND from_date <= ? AND to_date >= ?",self.user,self.subject_id,self.from_date,self.to_date])
    #2. Runde: Alle, die vorher beginnen und im eigenen Zeitraum enden
    cand += Rental.find(:all, :conditions => ["user <> ? AND subject_id = ? AND from_date <= ? AND to_date BETWEEN ? AND ?",self.user,self.subject_id,self.from_date,self.from_date,self.to_date])
    #3. Runde: Alle die gleichzeitig (bzw. darin beginnen)
    cand += Rental.find(:all, :conditions => ["user <> ? AND subject_id = ? AND from_date BETWEEN ? AND ?",self.user,self.subject_id,self.from_date,self.to_date])
    if cand.size > 0
      cand.uniq.map {|c| errors.add_to_base "Reservierung kollidiert mit: #{c.short}" unless c == self}
    end
    true
  end
  def to_s
    "#{subject} - Von: #{from_date} - Bis: #{to_date} - Ersteller: #{user} - Letzte Änderung #{updated_at}"
  end
  
  def short
    "#{user}: #{from_date} - #{to_date}"
  end
  
end
