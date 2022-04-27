package sit.int221.oasip.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sit.int221.oasip.entities.Event;
import sit.int221.oasip.repositories.EventRepository;

import java.util.List;

@RestController
@RequestMapping("/api/events")
public class EventsController {

    private final EventRepository erepo;

    public EventsController(EventRepository erepo) {
        this.erepo = erepo;
    }

    @GetMapping("")
    public List<Event> getAllEvents() {
        return erepo.findAll();
    }
}