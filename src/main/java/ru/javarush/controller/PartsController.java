package ru.javarush.controller;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.javarush.dao.DB;
import ru.javarush.dao.DBmysql;
import ru.javarush.dao.Details;
import ru.javarush.model.PartEntity;
import ru.javarush.model.Parts;

import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

@Controller
public class PartsController {
    DB db = DBmysql.getdBmysql();

    @RequestMapping(value = "/parts", method = RequestMethod.GET)
    public String printPagesParts(@RequestParam(value = "searchName", defaultValue = "") String searchName,
                                  @RequestParam(value = "empty", defaultValue = "NONE") Details details,
                                  @RequestParam(value = "page", defaultValue = "1") Integer page,
                                  ModelMap model) {

        model.addAttribute("searchName", searchName);
        model.addAttribute("empty", details);

        ArrayList<PartEntity> list;
        if (!searchName.equals(""))
            list = db.searchPartOnName(searchName);
        else if (!details.equals(Details.NONE))
                list = db.sortList(details);
            else list = db.getList();

        PagedListHolder<PartEntity> pagedListHolder = new PagedListHolder<>(list);
        pagedListHolder.setPageSize(10);
        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;
        pagedListHolder.setPage(page-1);

        model.addAttribute("page", page);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());
        model.addAttribute("parts", pagedListHolder.getPageList());
        model.addAttribute("min", db.minOptionTrue());

        return "parts";
    }

    @RequestMapping(value = "/addParts", method = RequestMethod.GET)
    public String showCreateParts(ModelMap model) {
        Parts parts = new Parts();
        model.addAttribute("parts", parts);
        return "addEditParts";
    }

    @RequestMapping(value = "/addParts", method = RequestMethod.POST)
    public String addParts(@ModelAttribute PartEntity parts) {
        db.insertUpdateParts(parts);
        return "redirect:parts";
    }

    @RequestMapping(value = "/editParts", method = RequestMethod.GET)
    public String showEditParts(@RequestParam("id") int id, ModelMap model) {
        model.addAttribute("parts", db.searchPartOnId(id));
        return "addEditParts";
    }

    @RequestMapping(value = "/deleteParts", method = RequestMethod.GET)
    public String deleteParts(@RequestParam("id") int id) {
        db.deleteParts(id);
        return "redirect:parts";
    }

    @ModelAttribute("sortName")
    public Map<Details, String> getCountryList() {
        Map<Details, String> countryList = new TreeMap<>();
        countryList.put(Details.NONE, "");
        countryList.put(Details.ALL, "Все детали");
        countryList.put(Details.OPTIONTRUE, "Детали, которые необходимы для сборки");
        countryList.put(Details.OPTIONFALSE, "Опциональные детали");
        return countryList;
    }

}
