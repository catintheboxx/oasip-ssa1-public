package sit.int221.oasip.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import sit.int221.oasip.dtos.*;
import sit.int221.oasip.entities.Event;
import sit.int221.oasip.repositories.EventRepository;
import sit.int221.oasip.services.EventServices;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;


@RestController
@RequestMapping("/api/events")
public class EventsController {

    private final EventServices eventServices;

    public EventsController(EventRepository erepo, EventServices eventServices) {
        this.eventServices = eventServices;
    }

//  GET Method

    //GET All
    @GetMapping("")
    public List<SimpleEventDTO> getAllEvents() {
        return eventServices.getAllEvents();
    }

    //GET by id
    @GetMapping("/{id}")
    public EventDetailDTO getEventById(
            @PathVariable Integer id
    ) {
        return eventServices.getEventById(id);
    }

    @GetMapping("/{categoryId}/{date}")
    public List<TimeDTO> getEventByCategoryIdAndDate(
            @PathVariable Integer categoryId,
            @PathVariable String date
    ){
        System.out.println(categoryId + " " + date);
        return eventServices.getEventByCatIdAndDate(categoryId, date);
    }

//   POST Method

//    Create new event
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("")
    public ResponseEntity createEvent(
           @Valid @RequestBody PostEventDTO newEvent,
           HttpServletRequest req
    ) throws MethodArgumentNotValidException {
        return eventServices.save(newEvent , req);
    }

//  DELETE Method

//  Delete existing event
    @DeleteMapping("/{id}")
    public void delete(
            @PathVariable Integer id
    ){
        eventServices.delete(id);
    }

//         PUT Method
//        //Update Event
        @ResponseStatus(HttpStatus.OK)
        @PutMapping("/{id}")
        public Event edit(
                @Valid @RequestBody PutEventDTO editEventDTO,
                @PathVariable Integer id
                ){
            return eventServices.update(id , editEventDTO);
        }



}
