import java.time.LocalDate;

class LocalDateWrapper implements Comparable<LocalDateWrapper> {
    private LocalDate date;

    public LocalDateWrapper(LocalDate date) {
        this.date = date;
    }

    public LocalDate getDate() {
        return date;
    }

    @Override
    public int compareTo(LocalDateWrapper other) {
        return date.compareTo(other.getDate());
    }

    public String toString() {
        return date.toString();
    }
}
